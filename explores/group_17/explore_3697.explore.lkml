# Explore: explore_3697
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11092.view.lkml"
include: "/views/domain_44/view_11094.view.lkml"
include: "/views/domain_45/view_11095.view.lkml"
include: "/views/domain_46/view_11096.view.lkml"

explore: explore_3697 {
  label: "Explore Explore 3697"
  description: "Comprehensive analytics explore joining base view_11092 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11092
  
  always_filter: {
    filters: [view_11092.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11092.created_at_date: "7 days"]
    unless: [view_11092.id, view_11092.status]
  }

  join: view_11094 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11092.user_id} = ${view_11094.id} ;;
    required_joins: []
  }

  join: view_11095 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11092.account_id} = ${view_11095.account_id} ;;
    required_joins: [view_11094]
  }

  join: view_11096 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11092.category} = ${view_11096.category} ;;
  }

  access_filter: {
    field: view_11092.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11092.is_deleted} = false ;;
}
