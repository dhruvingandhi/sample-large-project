# Explore: explore_2541
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07624.view.lkml"
include: "/views/domain_26/view_07626.view.lkml"
include: "/views/domain_27/view_07627.view.lkml"
include: "/views/domain_28/view_07628.view.lkml"

explore: explore_2541 {
  label: "Explore Explore 2541"
  description: "Comprehensive analytics explore joining base view_07624 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07624
  
  always_filter: {
    filters: [view_07624.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07624.created_at_date: "7 days"]
    unless: [view_07624.id, view_07624.status]
  }

  join: view_07626 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07624.user_id} = ${view_07626.id} ;;
    required_joins: []
  }

  join: view_07627 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07624.account_id} = ${view_07627.account_id} ;;
    required_joins: [view_07626]
  }

  join: view_07628 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07624.category} = ${view_07628.category} ;;
  }

  access_filter: {
    field: view_07624.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07624.is_deleted} = false ;;
}
