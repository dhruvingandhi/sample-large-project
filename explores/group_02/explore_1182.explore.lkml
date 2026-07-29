# Explore: explore_1182
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03547.view.lkml"
include: "/views/domain_49/view_03549.view.lkml"
include: "/views/domain_50/view_03550.view.lkml"
include: "/views/domain_01/view_03551.view.lkml"

explore: explore_1182 {
  label: "Explore Explore 1182"
  description: "Comprehensive analytics explore joining base view_03547 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03547
  
  always_filter: {
    filters: [view_03547.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03547.created_at_date: "7 days"]
    unless: [view_03547.id, view_03547.status]
  }

  join: view_03549 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03547.user_id} = ${view_03549.id} ;;
    required_joins: []
  }

  join: view_03550 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03547.account_id} = ${view_03550.account_id} ;;
    required_joins: [view_03549]
  }

  join: view_03551 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03547.category} = ${view_03551.category} ;;
  }

  access_filter: {
    field: view_03547.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03547.is_deleted} = false ;;
}
