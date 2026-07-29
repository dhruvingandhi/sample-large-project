# Explore: explore_2567
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07702.view.lkml"
include: "/views/domain_04/view_07704.view.lkml"
include: "/views/domain_05/view_07705.view.lkml"
include: "/views/domain_06/view_07706.view.lkml"

explore: explore_2567 {
  label: "Explore Explore 2567"
  description: "Comprehensive analytics explore joining base view_07702 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07702
  
  always_filter: {
    filters: [view_07702.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07702.created_at_date: "7 days"]
    unless: [view_07702.id, view_07702.status]
  }

  join: view_07704 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07702.user_id} = ${view_07704.id} ;;
    required_joins: []
  }

  join: view_07705 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07702.account_id} = ${view_07705.account_id} ;;
    required_joins: [view_07704]
  }

  join: view_07706 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07702.category} = ${view_07706.category} ;;
  }

  access_filter: {
    field: view_07702.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07702.is_deleted} = false ;;
}
