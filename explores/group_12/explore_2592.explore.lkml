# Explore: explore_2592
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07777.view.lkml"
include: "/views/domain_29/view_07779.view.lkml"
include: "/views/domain_30/view_07780.view.lkml"
include: "/views/domain_31/view_07781.view.lkml"

explore: explore_2592 {
  label: "Explore Explore 2592"
  description: "Comprehensive analytics explore joining base view_07777 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07777
  
  always_filter: {
    filters: [view_07777.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07777.created_at_date: "7 days"]
    unless: [view_07777.id, view_07777.status]
  }

  join: view_07779 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07777.user_id} = ${view_07779.id} ;;
    required_joins: []
  }

  join: view_07780 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07777.account_id} = ${view_07780.account_id} ;;
    required_joins: [view_07779]
  }

  join: view_07781 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07777.category} = ${view_07781.category} ;;
  }

  access_filter: {
    field: view_07777.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07777.is_deleted} = false ;;
}
