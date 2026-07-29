# Explore: explore_1566
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04699.view.lkml"
include: "/views/domain_01/view_04701.view.lkml"
include: "/views/domain_02/view_04702.view.lkml"
include: "/views/domain_03/view_04703.view.lkml"

explore: explore_1566 {
  label: "Explore Explore 1566"
  description: "Comprehensive analytics explore joining base view_04699 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04699
  
  always_filter: {
    filters: [view_04699.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04699.created_at_date: "7 days"]
    unless: [view_04699.id, view_04699.status]
  }

  join: view_04701 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04699.user_id} = ${view_04701.id} ;;
    required_joins: []
  }

  join: view_04702 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04699.account_id} = ${view_04702.account_id} ;;
    required_joins: [view_04701]
  }

  join: view_04703 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04699.category} = ${view_04703.category} ;;
  }

  access_filter: {
    field: view_04699.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04699.is_deleted} = false ;;
}
