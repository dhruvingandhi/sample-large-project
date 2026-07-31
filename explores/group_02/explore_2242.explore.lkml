# Update for 500 file diff target
# Explore: explore_2242
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06727.view.lkml"
include: "/views/domain_29/view_06729.view.lkml"
include: "/views/domain_30/view_06730.view.lkml"
include: "/views/domain_31/view_06731.view.lkml"

explore: explore_2242 {
  label: "Explore Explore 2242"
  description: "Comprehensive analytics explore joining base view_06727 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06727
  
  always_filter: {
    filters: [view_06727.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06727.created_at_date: "7 days"]
    unless: [view_06727.id, view_06727.status]
  }

  join: view_06729 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06727.user_id} = ${view_06729.id} ;;
    required_joins: []
  }

  join: view_06730 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06727.account_id} = ${view_06730.account_id} ;;
    required_joins: [view_06729]
  }

  join: view_06731 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06727.category} = ${view_06731.category} ;;
  }

  access_filter: {
    field: view_06727.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06727.is_deleted} = false ;;
}
