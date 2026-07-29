# Explore: explore_3536
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10609.view.lkml"
include: "/views/domain_11/view_10611.view.lkml"
include: "/views/domain_12/view_10612.view.lkml"
include: "/views/domain_13/view_10613.view.lkml"

explore: explore_3536 {
  label: "Explore Explore 3536"
  description: "Comprehensive analytics explore joining base view_10609 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10609
  
  always_filter: {
    filters: [view_10609.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10609.created_at_date: "7 days"]
    unless: [view_10609.id, view_10609.status]
  }

  join: view_10611 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10609.user_id} = ${view_10611.id} ;;
    required_joins: []
  }

  join: view_10612 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10609.account_id} = ${view_10612.account_id} ;;
    required_joins: [view_10611]
  }

  join: view_10613 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10609.category} = ${view_10613.category} ;;
  }

  access_filter: {
    field: view_10609.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10609.is_deleted} = false ;;
}
