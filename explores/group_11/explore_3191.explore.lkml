# Explore: explore_3191
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09574.view.lkml"
include: "/views/domain_26/view_09576.view.lkml"
include: "/views/domain_27/view_09577.view.lkml"
include: "/views/domain_28/view_09578.view.lkml"

explore: explore_3191 {
  label: "Explore Explore 3191"
  description: "Comprehensive analytics explore joining base view_09574 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09574
  
  always_filter: {
    filters: [view_09574.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09574.created_at_date: "7 days"]
    unless: [view_09574.id, view_09574.status]
  }

  join: view_09576 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09574.user_id} = ${view_09576.id} ;;
    required_joins: []
  }

  join: view_09577 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09574.account_id} = ${view_09577.account_id} ;;
    required_joins: [view_09576]
  }

  join: view_09578 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09574.category} = ${view_09578.category} ;;
  }

  access_filter: {
    field: view_09574.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09574.is_deleted} = false ;;
}
