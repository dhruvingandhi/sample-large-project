# Explore: explore_0567
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01702.view.lkml"
include: "/views/domain_04/view_01704.view.lkml"
include: "/views/domain_05/view_01705.view.lkml"
include: "/views/domain_06/view_01706.view.lkml"

explore: explore_0567 {
  label: "Explore Explore 0567"
  description: "Comprehensive analytics explore joining base view_01702 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01702
  
  always_filter: {
    filters: [view_01702.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01702.created_at_date: "7 days"]
    unless: [view_01702.id, view_01702.status]
  }

  join: view_01704 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01702.user_id} = ${view_01704.id} ;;
    required_joins: []
  }

  join: view_01705 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01702.account_id} = ${view_01705.account_id} ;;
    required_joins: [view_01704]
  }

  join: view_01706 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01702.category} = ${view_01706.category} ;;
  }

  access_filter: {
    field: view_01702.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01702.is_deleted} = false ;;
}
