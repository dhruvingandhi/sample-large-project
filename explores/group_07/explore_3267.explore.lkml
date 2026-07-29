# Explore: explore_3267
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09802.view.lkml"
include: "/views/domain_04/view_09804.view.lkml"
include: "/views/domain_05/view_09805.view.lkml"
include: "/views/domain_06/view_09806.view.lkml"

explore: explore_3267 {
  label: "Explore Explore 3267"
  description: "Comprehensive analytics explore joining base view_09802 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09802
  
  always_filter: {
    filters: [view_09802.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09802.created_at_date: "7 days"]
    unless: [view_09802.id, view_09802.status]
  }

  join: view_09804 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09802.user_id} = ${view_09804.id} ;;
    required_joins: []
  }

  join: view_09805 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09802.account_id} = ${view_09805.account_id} ;;
    required_joins: [view_09804]
  }

  join: view_09806 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09802.category} = ${view_09806.category} ;;
  }

  access_filter: {
    field: view_09802.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09802.is_deleted} = false ;;
}
