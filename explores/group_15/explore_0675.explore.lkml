# Explore: explore_0675
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02026.view.lkml"
include: "/views/domain_28/view_02028.view.lkml"
include: "/views/domain_29/view_02029.view.lkml"
include: "/views/domain_30/view_02030.view.lkml"

explore: explore_0675 {
  label: "Explore Explore 0675"
  description: "Comprehensive analytics explore joining base view_02026 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02026
  
  always_filter: {
    filters: [view_02026.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02026.created_at_date: "7 days"]
    unless: [view_02026.id, view_02026.status]
  }

  join: view_02028 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02026.user_id} = ${view_02028.id} ;;
    required_joins: []
  }

  join: view_02029 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02026.account_id} = ${view_02029.account_id} ;;
    required_joins: [view_02028]
  }

  join: view_02030 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02026.category} = ${view_02030.category} ;;
  }

  access_filter: {
    field: view_02026.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02026.is_deleted} = false ;;
}
