# Explore: explore_3523
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10570.view.lkml"
include: "/views/domain_22/view_10572.view.lkml"
include: "/views/domain_23/view_10573.view.lkml"
include: "/views/domain_24/view_10574.view.lkml"

explore: explore_3523 {
  label: "Explore Explore 3523"
  description: "Comprehensive analytics explore joining base view_10570 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10570
  
  always_filter: {
    filters: [view_10570.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10570.created_at_date: "7 days"]
    unless: [view_10570.id, view_10570.status]
  }

  join: view_10572 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10570.user_id} = ${view_10572.id} ;;
    required_joins: []
  }

  join: view_10573 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10570.account_id} = ${view_10573.account_id} ;;
    required_joins: [view_10572]
  }

  join: view_10574 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10570.category} = ${view_10574.category} ;;
  }

  access_filter: {
    field: view_10570.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10570.is_deleted} = false ;;
}
