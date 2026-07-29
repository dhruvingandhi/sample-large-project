# Explore: explore_1159
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03478.view.lkml"
include: "/views/domain_30/view_03480.view.lkml"
include: "/views/domain_31/view_03481.view.lkml"
include: "/views/domain_32/view_03482.view.lkml"

explore: explore_1159 {
  label: "Explore Explore 1159"
  description: "Comprehensive analytics explore joining base view_03478 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03478
  
  always_filter: {
    filters: [view_03478.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03478.created_at_date: "7 days"]
    unless: [view_03478.id, view_03478.status]
  }

  join: view_03480 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03478.user_id} = ${view_03480.id} ;;
    required_joins: []
  }

  join: view_03481 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03478.account_id} = ${view_03481.account_id} ;;
    required_joins: [view_03480]
  }

  join: view_03482 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03478.category} = ${view_03482.category} ;;
  }

  access_filter: {
    field: view_03478.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03478.is_deleted} = false ;;
}
