# Explore: explore_1527
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04582.view.lkml"
include: "/views/domain_34/view_04584.view.lkml"
include: "/views/domain_35/view_04585.view.lkml"
include: "/views/domain_36/view_04586.view.lkml"

explore: explore_1527 {
  label: "Explore Explore 1527"
  description: "Comprehensive analytics explore joining base view_04582 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04582
  
  always_filter: {
    filters: [view_04582.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04582.created_at_date: "7 days"]
    unless: [view_04582.id, view_04582.status]
  }

  join: view_04584 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04582.user_id} = ${view_04584.id} ;;
    required_joins: []
  }

  join: view_04585 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04582.account_id} = ${view_04585.account_id} ;;
    required_joins: [view_04584]
  }

  join: view_04586 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04582.category} = ${view_04586.category} ;;
  }

  access_filter: {
    field: view_04582.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04582.is_deleted} = false ;;
}
