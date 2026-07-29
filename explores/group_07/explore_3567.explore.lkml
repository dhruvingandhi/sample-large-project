# Explore: explore_3567
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10702.view.lkml"
include: "/views/domain_04/view_10704.view.lkml"
include: "/views/domain_05/view_10705.view.lkml"
include: "/views/domain_06/view_10706.view.lkml"

explore: explore_3567 {
  label: "Explore Explore 3567"
  description: "Comprehensive analytics explore joining base view_10702 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10702
  
  always_filter: {
    filters: [view_10702.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10702.created_at_date: "7 days"]
    unless: [view_10702.id, view_10702.status]
  }

  join: view_10704 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10702.user_id} = ${view_10704.id} ;;
    required_joins: []
  }

  join: view_10705 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10702.account_id} = ${view_10705.account_id} ;;
    required_joins: [view_10704]
  }

  join: view_10706 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10702.category} = ${view_10706.category} ;;
  }

  access_filter: {
    field: view_10702.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10702.is_deleted} = false ;;
}
