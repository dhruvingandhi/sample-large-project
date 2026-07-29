# Explore: explore_0566
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01699.view.lkml"
include: "/views/domain_01/view_01701.view.lkml"
include: "/views/domain_02/view_01702.view.lkml"
include: "/views/domain_03/view_01703.view.lkml"

explore: explore_0566 {
  label: "Explore Explore 0566"
  description: "Comprehensive analytics explore joining base view_01699 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01699
  
  always_filter: {
    filters: [view_01699.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01699.created_at_date: "7 days"]
    unless: [view_01699.id, view_01699.status]
  }

  join: view_01701 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01699.user_id} = ${view_01701.id} ;;
    required_joins: []
  }

  join: view_01702 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01699.account_id} = ${view_01702.account_id} ;;
    required_joins: [view_01701]
  }

  join: view_01703 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01699.category} = ${view_01703.category} ;;
  }

  access_filter: {
    field: view_01699.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01699.is_deleted} = false ;;
}
