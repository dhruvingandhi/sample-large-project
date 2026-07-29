# Explore: explore_1525
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04576.view.lkml"
include: "/views/domain_28/view_04578.view.lkml"
include: "/views/domain_29/view_04579.view.lkml"
include: "/views/domain_30/view_04580.view.lkml"

explore: explore_1525 {
  label: "Explore Explore 1525"
  description: "Comprehensive analytics explore joining base view_04576 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04576
  
  always_filter: {
    filters: [view_04576.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04576.created_at_date: "7 days"]
    unless: [view_04576.id, view_04576.status]
  }

  join: view_04578 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04576.user_id} = ${view_04578.id} ;;
    required_joins: []
  }

  join: view_04579 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04576.account_id} = ${view_04579.account_id} ;;
    required_joins: [view_04578]
  }

  join: view_04580 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04576.category} = ${view_04580.category} ;;
  }

  access_filter: {
    field: view_04576.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04576.is_deleted} = false ;;
}
