# Explore: explore_2330
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06991.view.lkml"
include: "/views/domain_43/view_06993.view.lkml"
include: "/views/domain_44/view_06994.view.lkml"
include: "/views/domain_45/view_06995.view.lkml"

explore: explore_2330 {
  label: "Explore Explore 2330"
  description: "Comprehensive analytics explore joining base view_06991 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06991
  
  always_filter: {
    filters: [view_06991.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06991.created_at_date: "7 days"]
    unless: [view_06991.id, view_06991.status]
  }

  join: view_06993 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06991.user_id} = ${view_06993.id} ;;
    required_joins: []
  }

  join: view_06994 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06991.account_id} = ${view_06994.account_id} ;;
    required_joins: [view_06993]
  }

  join: view_06995 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06991.category} = ${view_06995.category} ;;
  }

  access_filter: {
    field: view_06991.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06991.is_deleted} = false ;;
}
