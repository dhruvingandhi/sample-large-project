# Explore: explore_1599
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04798.view.lkml"
include: "/views/domain_50/view_04800.view.lkml"
include: "/views/domain_01/view_04801.view.lkml"
include: "/views/domain_02/view_04802.view.lkml"

explore: explore_1599 {
  label: "Explore Explore 1599"
  description: "Comprehensive analytics explore joining base view_04798 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04798
  
  always_filter: {
    filters: [view_04798.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04798.created_at_date: "7 days"]
    unless: [view_04798.id, view_04798.status]
  }

  join: view_04800 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04798.user_id} = ${view_04800.id} ;;
    required_joins: []
  }

  join: view_04801 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04798.account_id} = ${view_04801.account_id} ;;
    required_joins: [view_04800]
  }

  join: view_04802 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04798.category} = ${view_04802.category} ;;
  }

  access_filter: {
    field: view_04798.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04798.is_deleted} = false ;;
}
