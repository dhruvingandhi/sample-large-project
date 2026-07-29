# Explore: explore_1567
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04702.view.lkml"
include: "/views/domain_04/view_04704.view.lkml"
include: "/views/domain_05/view_04705.view.lkml"
include: "/views/domain_06/view_04706.view.lkml"

explore: explore_1567 {
  label: "Explore Explore 1567"
  description: "Comprehensive analytics explore joining base view_04702 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04702
  
  always_filter: {
    filters: [view_04702.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04702.created_at_date: "7 days"]
    unless: [view_04702.id, view_04702.status]
  }

  join: view_04704 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04702.user_id} = ${view_04704.id} ;;
    required_joins: []
  }

  join: view_04705 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04702.account_id} = ${view_04705.account_id} ;;
    required_joins: [view_04704]
  }

  join: view_04706 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04702.category} = ${view_04706.category} ;;
  }

  access_filter: {
    field: view_04702.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04702.is_deleted} = false ;;
}
