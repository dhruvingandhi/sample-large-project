# Update for 2000 file diff target
# Explore: explore_2400
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07201.view.lkml"
include: "/views/domain_03/view_07203.view.lkml"
include: "/views/domain_04/view_07204.view.lkml"
include: "/views/domain_05/view_07205.view.lkml"

explore: explore_2400 {
  label: "Explore Explore 2400"
  description: "Comprehensive analytics explore joining base view_07201 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07201
  
  always_filter: {
    filters: [view_07201.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07201.created_at_date: "7 days"]
    unless: [view_07201.id, view_07201.status]
  }

  join: view_07203 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07201.user_id} = ${view_07203.id} ;;
    required_joins: []
  }

  join: view_07204 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07201.account_id} = ${view_07204.account_id} ;;
    required_joins: [view_07203]
  }

  join: view_07205 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07201.category} = ${view_07205.category} ;;
  }

  access_filter: {
    field: view_07201.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07201.is_deleted} = false ;;
}
