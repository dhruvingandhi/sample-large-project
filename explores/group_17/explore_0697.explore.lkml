# Explore: explore_0697
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02092.view.lkml"
include: "/views/domain_44/view_02094.view.lkml"
include: "/views/domain_45/view_02095.view.lkml"
include: "/views/domain_46/view_02096.view.lkml"

explore: explore_0697 {
  label: "Explore Explore 0697"
  description: "Comprehensive analytics explore joining base view_02092 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02092
  
  always_filter: {
    filters: [view_02092.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02092.created_at_date: "7 days"]
    unless: [view_02092.id, view_02092.status]
  }

  join: view_02094 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02092.user_id} = ${view_02094.id} ;;
    required_joins: []
  }

  join: view_02095 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02092.account_id} = ${view_02095.account_id} ;;
    required_joins: [view_02094]
  }

  join: view_02096 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02092.category} = ${view_02096.category} ;;
  }

  access_filter: {
    field: view_02092.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02092.is_deleted} = false ;;
}
