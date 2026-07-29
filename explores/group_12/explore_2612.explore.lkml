# Explore: explore_2612
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07837.view.lkml"
include: "/views/domain_39/view_07839.view.lkml"
include: "/views/domain_40/view_07840.view.lkml"
include: "/views/domain_41/view_07841.view.lkml"

explore: explore_2612 {
  label: "Explore Explore 2612"
  description: "Comprehensive analytics explore joining base view_07837 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07837
  
  always_filter: {
    filters: [view_07837.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07837.created_at_date: "7 days"]
    unless: [view_07837.id, view_07837.status]
  }

  join: view_07839 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07837.user_id} = ${view_07839.id} ;;
    required_joins: []
  }

  join: view_07840 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07837.account_id} = ${view_07840.account_id} ;;
    required_joins: [view_07839]
  }

  join: view_07841 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07837.category} = ${view_07841.category} ;;
  }

  access_filter: {
    field: view_07837.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07837.is_deleted} = false ;;
}
