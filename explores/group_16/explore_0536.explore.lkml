# Explore: explore_0536
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01609.view.lkml"
include: "/views/domain_11/view_01611.view.lkml"
include: "/views/domain_12/view_01612.view.lkml"
include: "/views/domain_13/view_01613.view.lkml"

explore: explore_0536 {
  label: "Explore Explore 0536"
  description: "Comprehensive analytics explore joining base view_01609 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01609
  
  always_filter: {
    filters: [view_01609.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01609.created_at_date: "7 days"]
    unless: [view_01609.id, view_01609.status]
  }

  join: view_01611 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01609.user_id} = ${view_01611.id} ;;
    required_joins: []
  }

  join: view_01612 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01609.account_id} = ${view_01612.account_id} ;;
    required_joins: [view_01611]
  }

  join: view_01613 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01609.category} = ${view_01613.category} ;;
  }

  access_filter: {
    field: view_01609.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01609.is_deleted} = false ;;
}
