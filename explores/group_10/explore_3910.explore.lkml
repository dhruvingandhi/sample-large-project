# Explore: explore_3910
# Auto-generated LookML Explore File

include: "/views/domain_31/view_11731.view.lkml"
include: "/views/domain_33/view_11733.view.lkml"
include: "/views/domain_34/view_11734.view.lkml"
include: "/views/domain_35/view_11735.view.lkml"

explore: explore_3910 {
  label: "Explore Explore 3910"
  description: "Comprehensive analytics explore joining base view_11731 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11731
  
  always_filter: {
    filters: [view_11731.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11731.created_at_date: "7 days"]
    unless: [view_11731.id, view_11731.status]
  }

  join: view_11733 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11731.user_id} = ${view_11733.id} ;;
    required_joins: []
  }

  join: view_11734 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11731.account_id} = ${view_11734.account_id} ;;
    required_joins: [view_11733]
  }

  join: view_11735 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11731.category} = ${view_11735.category} ;;
  }

  access_filter: {
    field: view_11731.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11731.is_deleted} = false ;;
}
