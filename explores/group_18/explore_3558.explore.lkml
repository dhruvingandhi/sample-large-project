# Update for 2000 file diff target
# Explore: explore_3558
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10675.view.lkml"
include: "/views/domain_27/view_10677.view.lkml"
include: "/views/domain_28/view_10678.view.lkml"
include: "/views/domain_29/view_10679.view.lkml"

explore: explore_3558 {
  label: "Explore Explore 3558"
  description: "Comprehensive analytics explore joining base view_10675 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10675
  
  always_filter: {
    filters: [view_10675.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10675.created_at_date: "7 days"]
    unless: [view_10675.id, view_10675.status]
  }

  join: view_10677 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10675.user_id} = ${view_10677.id} ;;
    required_joins: []
  }

  join: view_10678 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10675.account_id} = ${view_10678.account_id} ;;
    required_joins: [view_10677]
  }

  join: view_10679 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10675.category} = ${view_10679.category} ;;
  }

  access_filter: {
    field: view_10675.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10675.is_deleted} = false ;;
}
