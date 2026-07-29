# Explore: explore_3566
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10699.view.lkml"
include: "/views/domain_01/view_10701.view.lkml"
include: "/views/domain_02/view_10702.view.lkml"
include: "/views/domain_03/view_10703.view.lkml"

explore: explore_3566 {
  label: "Explore Explore 3566"
  description: "Comprehensive analytics explore joining base view_10699 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10699
  
  always_filter: {
    filters: [view_10699.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10699.created_at_date: "7 days"]
    unless: [view_10699.id, view_10699.status]
  }

  join: view_10701 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10699.user_id} = ${view_10701.id} ;;
    required_joins: []
  }

  join: view_10702 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10699.account_id} = ${view_10702.account_id} ;;
    required_joins: [view_10701]
  }

  join: view_10703 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10699.category} = ${view_10703.category} ;;
  }

  access_filter: {
    field: view_10699.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10699.is_deleted} = false ;;
}
