# Update for 2000 file diff target
# Explore: explore_0900
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02701.view.lkml"
include: "/views/domain_03/view_02703.view.lkml"
include: "/views/domain_04/view_02704.view.lkml"
include: "/views/domain_05/view_02705.view.lkml"

explore: explore_0900 {
  label: "Explore Explore 0900"
  description: "Comprehensive analytics explore joining base view_02701 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02701
  
  always_filter: {
    filters: [view_02701.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02701.created_at_date: "7 days"]
    unless: [view_02701.id, view_02701.status]
  }

  join: view_02703 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02701.user_id} = ${view_02703.id} ;;
    required_joins: []
  }

  join: view_02704 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02701.account_id} = ${view_02704.account_id} ;;
    required_joins: [view_02703]
  }

  join: view_02705 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02701.category} = ${view_02705.category} ;;
  }

  access_filter: {
    field: view_02701.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02701.is_deleted} = false ;;
}
