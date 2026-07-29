# Explore: explore_1011
# Auto-generated LookML Explore File

include: "/views/domain_34/view_03034.view.lkml"
include: "/views/domain_36/view_03036.view.lkml"
include: "/views/domain_37/view_03037.view.lkml"
include: "/views/domain_38/view_03038.view.lkml"

explore: explore_1011 {
  label: "Explore Explore 1011"
  description: "Comprehensive analytics explore joining base view_03034 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03034
  
  always_filter: {
    filters: [view_03034.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03034.created_at_date: "7 days"]
    unless: [view_03034.id, view_03034.status]
  }

  join: view_03036 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03034.user_id} = ${view_03036.id} ;;
    required_joins: []
  }

  join: view_03037 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03034.account_id} = ${view_03037.account_id} ;;
    required_joins: [view_03036]
  }

  join: view_03038 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03034.category} = ${view_03038.category} ;;
  }

  access_filter: {
    field: view_03034.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03034.is_deleted} = false ;;
}
