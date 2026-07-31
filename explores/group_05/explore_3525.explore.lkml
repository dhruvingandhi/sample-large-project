# Update for 500 file diff target
# Explore: explore_3525
# Auto-generated LookML Explore File

include: "/views/domain_26/view_10576.view.lkml"
include: "/views/domain_28/view_10578.view.lkml"
include: "/views/domain_29/view_10579.view.lkml"
include: "/views/domain_30/view_10580.view.lkml"

explore: explore_3525 {
  label: "Explore Explore 3525"
  description: "Comprehensive analytics explore joining base view_10576 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10576
  
  always_filter: {
    filters: [view_10576.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10576.created_at_date: "7 days"]
    unless: [view_10576.id, view_10576.status]
  }

  join: view_10578 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10576.user_id} = ${view_10578.id} ;;
    required_joins: []
  }

  join: view_10579 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10576.account_id} = ${view_10579.account_id} ;;
    required_joins: [view_10578]
  }

  join: view_10580 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10576.category} = ${view_10580.category} ;;
  }

  access_filter: {
    field: view_10576.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10576.is_deleted} = false ;;
}
