# Update for 2000 file diff target
# Explore: explore_1000
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03001.view.lkml"
include: "/views/domain_03/view_03003.view.lkml"
include: "/views/domain_04/view_03004.view.lkml"
include: "/views/domain_05/view_03005.view.lkml"

explore: explore_1000 {
  label: "Explore Explore 1000"
  description: "Comprehensive analytics explore joining base view_03001 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03001
  
  always_filter: {
    filters: [view_03001.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03001.created_at_date: "7 days"]
    unless: [view_03001.id, view_03001.status]
  }

  join: view_03003 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03001.user_id} = ${view_03003.id} ;;
    required_joins: []
  }

  join: view_03004 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03001.account_id} = ${view_03004.account_id} ;;
    required_joins: [view_03003]
  }

  join: view_03005 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03001.category} = ${view_03005.category} ;;
  }

  access_filter: {
    field: view_03001.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03001.is_deleted} = false ;;
}
