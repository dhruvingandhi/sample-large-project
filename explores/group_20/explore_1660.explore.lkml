# Update for 2000 file diff target
# Explore: explore_1660
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04981.view.lkml"
include: "/views/domain_33/view_04983.view.lkml"
include: "/views/domain_34/view_04984.view.lkml"
include: "/views/domain_35/view_04985.view.lkml"

explore: explore_1660 {
  label: "Explore Explore 1660"
  description: "Comprehensive analytics explore joining base view_04981 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04981
  
  always_filter: {
    filters: [view_04981.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04981.created_at_date: "7 days"]
    unless: [view_04981.id, view_04981.status]
  }

  join: view_04983 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04981.user_id} = ${view_04983.id} ;;
    required_joins: []
  }

  join: view_04984 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04981.account_id} = ${view_04984.account_id} ;;
    required_joins: [view_04983]
  }

  join: view_04985 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04981.category} = ${view_04985.category} ;;
  }

  access_filter: {
    field: view_04981.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04981.is_deleted} = false ;;
}
