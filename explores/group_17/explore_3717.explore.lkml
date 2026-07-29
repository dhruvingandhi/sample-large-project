# Explore: explore_3717
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11152.view.lkml"
include: "/views/domain_04/view_11154.view.lkml"
include: "/views/domain_05/view_11155.view.lkml"
include: "/views/domain_06/view_11156.view.lkml"

explore: explore_3717 {
  label: "Explore Explore 3717"
  description: "Comprehensive analytics explore joining base view_11152 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11152
  
  always_filter: {
    filters: [view_11152.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11152.created_at_date: "7 days"]
    unless: [view_11152.id, view_11152.status]
  }

  join: view_11154 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11152.user_id} = ${view_11154.id} ;;
    required_joins: []
  }

  join: view_11155 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11152.account_id} = ${view_11155.account_id} ;;
    required_joins: [view_11154]
  }

  join: view_11156 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11152.category} = ${view_11156.category} ;;
  }

  access_filter: {
    field: view_11152.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11152.is_deleted} = false ;;
}
