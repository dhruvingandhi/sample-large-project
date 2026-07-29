# Explore: explore_3522
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10567.view.lkml"
include: "/views/domain_19/view_10569.view.lkml"
include: "/views/domain_20/view_10570.view.lkml"
include: "/views/domain_21/view_10571.view.lkml"

explore: explore_3522 {
  label: "Explore Explore 3522"
  description: "Comprehensive analytics explore joining base view_10567 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10567
  
  always_filter: {
    filters: [view_10567.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10567.created_at_date: "7 days"]
    unless: [view_10567.id, view_10567.status]
  }

  join: view_10569 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10567.user_id} = ${view_10569.id} ;;
    required_joins: []
  }

  join: view_10570 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10567.account_id} = ${view_10570.account_id} ;;
    required_joins: [view_10569]
  }

  join: view_10571 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10567.category} = ${view_10571.category} ;;
  }

  access_filter: {
    field: view_10567.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10567.is_deleted} = false ;;
}
