# Explore: explore_1242
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03727.view.lkml"
include: "/views/domain_29/view_03729.view.lkml"
include: "/views/domain_30/view_03730.view.lkml"
include: "/views/domain_31/view_03731.view.lkml"

explore: explore_1242 {
  label: "Explore Explore 1242"
  description: "Comprehensive analytics explore joining base view_03727 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03727
  
  always_filter: {
    filters: [view_03727.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03727.created_at_date: "7 days"]
    unless: [view_03727.id, view_03727.status]
  }

  join: view_03729 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03727.user_id} = ${view_03729.id} ;;
    required_joins: []
  }

  join: view_03730 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03727.account_id} = ${view_03730.account_id} ;;
    required_joins: [view_03729]
  }

  join: view_03731 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03727.category} = ${view_03731.category} ;;
  }

  access_filter: {
    field: view_03727.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03727.is_deleted} = false ;;
}
