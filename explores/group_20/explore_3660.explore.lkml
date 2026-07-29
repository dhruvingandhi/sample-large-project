# Explore: explore_3660
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10981.view.lkml"
include: "/views/domain_33/view_10983.view.lkml"
include: "/views/domain_34/view_10984.view.lkml"
include: "/views/domain_35/view_10985.view.lkml"

explore: explore_3660 {
  label: "Explore Explore 3660"
  description: "Comprehensive analytics explore joining base view_10981 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10981
  
  always_filter: {
    filters: [view_10981.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10981.created_at_date: "7 days"]
    unless: [view_10981.id, view_10981.status]
  }

  join: view_10983 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10981.user_id} = ${view_10983.id} ;;
    required_joins: []
  }

  join: view_10984 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10981.account_id} = ${view_10984.account_id} ;;
    required_joins: [view_10983]
  }

  join: view_10985 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10981.category} = ${view_10985.category} ;;
  }

  access_filter: {
    field: view_10981.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10981.is_deleted} = false ;;
}
