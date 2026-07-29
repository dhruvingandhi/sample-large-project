# Explore: explore_0012
# Auto-generated LookML Explore File

include: "/views/domain_37/view_00037.view.lkml"
include: "/views/domain_39/view_00039.view.lkml"
include: "/views/domain_40/view_00040.view.lkml"
include: "/views/domain_41/view_00041.view.lkml"

explore: explore_0012 {
  label: "Explore Explore 0012"
  description: "Comprehensive analytics explore joining base view_00037 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00037
  
  always_filter: {
    filters: [view_00037.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00037.created_at_date: "7 days"]
    unless: [view_00037.id, view_00037.status]
  }

  join: view_00039 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00037.user_id} = ${view_00039.id} ;;
    required_joins: []
  }

  join: view_00040 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00037.account_id} = ${view_00040.account_id} ;;
    required_joins: [view_00039]
  }

  join: view_00041 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00037.category} = ${view_00041.category} ;;
  }

  access_filter: {
    field: view_00037.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00037.is_deleted} = false ;;
}
