# Explore: explore_0267
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00802.view.lkml"
include: "/views/domain_04/view_00804.view.lkml"
include: "/views/domain_05/view_00805.view.lkml"
include: "/views/domain_06/view_00806.view.lkml"

explore: explore_0267 {
  label: "Explore Explore 0267"
  description: "Comprehensive analytics explore joining base view_00802 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00802
  
  always_filter: {
    filters: [view_00802.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00802.created_at_date: "7 days"]
    unless: [view_00802.id, view_00802.status]
  }

  join: view_00804 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00802.user_id} = ${view_00804.id} ;;
    required_joins: []
  }

  join: view_00805 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00802.account_id} = ${view_00805.account_id} ;;
    required_joins: [view_00804]
  }

  join: view_00806 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00802.category} = ${view_00806.category} ;;
  }

  access_filter: {
    field: view_00802.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00802.is_deleted} = false ;;
}
