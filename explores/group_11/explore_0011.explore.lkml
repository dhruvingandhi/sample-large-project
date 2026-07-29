# Explore: explore_0011
# Auto-generated LookML Explore File

include: "/views/domain_34/view_00034.view.lkml"
include: "/views/domain_36/view_00036.view.lkml"
include: "/views/domain_37/view_00037.view.lkml"
include: "/views/domain_38/view_00038.view.lkml"

explore: explore_0011 {
  label: "Explore Explore 0011"
  description: "Comprehensive analytics explore joining base view_00034 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00034
  
  always_filter: {
    filters: [view_00034.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00034.created_at_date: "7 days"]
    unless: [view_00034.id, view_00034.status]
  }

  join: view_00036 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00034.user_id} = ${view_00036.id} ;;
    required_joins: []
  }

  join: view_00037 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00034.account_id} = ${view_00037.account_id} ;;
    required_joins: [view_00036]
  }

  join: view_00038 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00034.category} = ${view_00038.category} ;;
  }

  access_filter: {
    field: view_00034.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00034.is_deleted} = false ;;
}
