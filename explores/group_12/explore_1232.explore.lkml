# Explore: explore_1232
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03697.view.lkml"
include: "/views/domain_49/view_03699.view.lkml"
include: "/views/domain_50/view_03700.view.lkml"
include: "/views/domain_01/view_03701.view.lkml"

explore: explore_1232 {
  label: "Explore Explore 1232"
  description: "Comprehensive analytics explore joining base view_03697 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03697
  
  always_filter: {
    filters: [view_03697.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03697.created_at_date: "7 days"]
    unless: [view_03697.id, view_03697.status]
  }

  join: view_03699 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03697.user_id} = ${view_03699.id} ;;
    required_joins: []
  }

  join: view_03700 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03697.account_id} = ${view_03700.account_id} ;;
    required_joins: [view_03699]
  }

  join: view_03701 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03697.category} = ${view_03701.category} ;;
  }

  access_filter: {
    field: view_03697.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03697.is_deleted} = false ;;
}
