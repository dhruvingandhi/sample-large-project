# Explore: explore_2525
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07576.view.lkml"
include: "/views/domain_28/view_07578.view.lkml"
include: "/views/domain_29/view_07579.view.lkml"
include: "/views/domain_30/view_07580.view.lkml"

explore: explore_2525 {
  label: "Explore Explore 2525"
  description: "Comprehensive analytics explore joining base view_07576 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07576
  
  always_filter: {
    filters: [view_07576.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07576.created_at_date: "7 days"]
    unless: [view_07576.id, view_07576.status]
  }

  join: view_07578 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07576.user_id} = ${view_07578.id} ;;
    required_joins: []
  }

  join: view_07579 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07576.account_id} = ${view_07579.account_id} ;;
    required_joins: [view_07578]
  }

  join: view_07580 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07576.category} = ${view_07580.category} ;;
  }

  access_filter: {
    field: view_07576.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07576.is_deleted} = false ;;
}
