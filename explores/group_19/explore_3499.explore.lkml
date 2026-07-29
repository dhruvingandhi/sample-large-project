# Explore: explore_3499
# Auto-generated LookML Explore File

include: "/views/domain_48/view_10498.view.lkml"
include: "/views/domain_50/view_10500.view.lkml"
include: "/views/domain_01/view_10501.view.lkml"
include: "/views/domain_02/view_10502.view.lkml"

explore: explore_3499 {
  label: "Explore Explore 3499"
  description: "Comprehensive analytics explore joining base view_10498 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10498
  
  always_filter: {
    filters: [view_10498.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10498.created_at_date: "7 days"]
    unless: [view_10498.id, view_10498.status]
  }

  join: view_10500 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10498.user_id} = ${view_10500.id} ;;
    required_joins: []
  }

  join: view_10501 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10498.account_id} = ${view_10501.account_id} ;;
    required_joins: [view_10500]
  }

  join: view_10502 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10498.category} = ${view_10502.category} ;;
  }

  access_filter: {
    field: view_10498.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10498.is_deleted} = false ;;
}
