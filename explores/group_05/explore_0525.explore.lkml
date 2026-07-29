# Explore: explore_0525
# Auto-generated LookML Explore File

include: "/views/domain_26/view_01576.view.lkml"
include: "/views/domain_28/view_01578.view.lkml"
include: "/views/domain_29/view_01579.view.lkml"
include: "/views/domain_30/view_01580.view.lkml"

explore: explore_0525 {
  label: "Explore Explore 0525"
  description: "Comprehensive analytics explore joining base view_01576 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01576
  
  always_filter: {
    filters: [view_01576.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01576.created_at_date: "7 days"]
    unless: [view_01576.id, view_01576.status]
  }

  join: view_01578 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01576.user_id} = ${view_01578.id} ;;
    required_joins: []
  }

  join: view_01579 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01576.account_id} = ${view_01579.account_id} ;;
    required_joins: [view_01578]
  }

  join: view_01580 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01576.category} = ${view_01580.category} ;;
  }

  access_filter: {
    field: view_01576.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01576.is_deleted} = false ;;
}
