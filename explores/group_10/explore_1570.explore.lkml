# Update for 2000 file diff target
# Explore: explore_1570
# Auto-generated LookML Explore File

include: "/views/domain_11/view_04711.view.lkml"
include: "/views/domain_13/view_04713.view.lkml"
include: "/views/domain_14/view_04714.view.lkml"
include: "/views/domain_15/view_04715.view.lkml"

explore: explore_1570 {
  label: "Explore Explore 1570"
  description: "Comprehensive analytics explore joining base view_04711 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04711
  
  always_filter: {
    filters: [view_04711.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04711.created_at_date: "7 days"]
    unless: [view_04711.id, view_04711.status]
  }

  join: view_04713 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04711.user_id} = ${view_04713.id} ;;
    required_joins: []
  }

  join: view_04714 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04711.account_id} = ${view_04714.account_id} ;;
    required_joins: [view_04713]
  }

  join: view_04715 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04711.category} = ${view_04715.category} ;;
  }

  access_filter: {
    field: view_04711.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04711.is_deleted} = false ;;
}
