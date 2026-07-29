# Explore: explore_2331
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06994.view.lkml"
include: "/views/domain_46/view_06996.view.lkml"
include: "/views/domain_47/view_06997.view.lkml"
include: "/views/domain_48/view_06998.view.lkml"

explore: explore_2331 {
  label: "Explore Explore 2331"
  description: "Comprehensive analytics explore joining base view_06994 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06994
  
  always_filter: {
    filters: [view_06994.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06994.created_at_date: "7 days"]
    unless: [view_06994.id, view_06994.status]
  }

  join: view_06996 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06994.user_id} = ${view_06996.id} ;;
    required_joins: []
  }

  join: view_06997 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06994.account_id} = ${view_06997.account_id} ;;
    required_joins: [view_06996]
  }

  join: view_06998 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06994.category} = ${view_06998.category} ;;
  }

  access_filter: {
    field: view_06994.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06994.is_deleted} = false ;;
}
