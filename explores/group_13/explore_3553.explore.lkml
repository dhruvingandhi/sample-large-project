# Explore: explore_3553
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10660.view.lkml"
include: "/views/domain_12/view_10662.view.lkml"
include: "/views/domain_13/view_10663.view.lkml"
include: "/views/domain_14/view_10664.view.lkml"

explore: explore_3553 {
  label: "Explore Explore 3553"
  description: "Comprehensive analytics explore joining base view_10660 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10660
  
  always_filter: {
    filters: [view_10660.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10660.created_at_date: "7 days"]
    unless: [view_10660.id, view_10660.status]
  }

  join: view_10662 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10660.user_id} = ${view_10662.id} ;;
    required_joins: []
  }

  join: view_10663 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10660.account_id} = ${view_10663.account_id} ;;
    required_joins: [view_10662]
  }

  join: view_10664 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10660.category} = ${view_10664.category} ;;
  }

  access_filter: {
    field: view_10660.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10660.is_deleted} = false ;;
}
