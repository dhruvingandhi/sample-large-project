# Explore: explore_2536
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07609.view.lkml"
include: "/views/domain_11/view_07611.view.lkml"
include: "/views/domain_12/view_07612.view.lkml"
include: "/views/domain_13/view_07613.view.lkml"

explore: explore_2536 {
  label: "Explore Explore 2536"
  description: "Comprehensive analytics explore joining base view_07609 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07609
  
  always_filter: {
    filters: [view_07609.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07609.created_at_date: "7 days"]
    unless: [view_07609.id, view_07609.status]
  }

  join: view_07611 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07609.user_id} = ${view_07611.id} ;;
    required_joins: []
  }

  join: view_07612 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07609.account_id} = ${view_07612.account_id} ;;
    required_joins: [view_07611]
  }

  join: view_07613 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07609.category} = ${view_07613.category} ;;
  }

  access_filter: {
    field: view_07609.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07609.is_deleted} = false ;;
}
