# Explore: explore_1926
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05779.view.lkml"
include: "/views/domain_31/view_05781.view.lkml"
include: "/views/domain_32/view_05782.view.lkml"
include: "/views/domain_33/view_05783.view.lkml"

explore: explore_1926 {
  label: "Explore Explore 1926"
  description: "Comprehensive analytics explore joining base view_05779 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05779
  
  always_filter: {
    filters: [view_05779.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05779.created_at_date: "7 days"]
    unless: [view_05779.id, view_05779.status]
  }

  join: view_05781 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05779.user_id} = ${view_05781.id} ;;
    required_joins: []
  }

  join: view_05782 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05779.account_id} = ${view_05782.account_id} ;;
    required_joins: [view_05781]
  }

  join: view_05783 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05779.category} = ${view_05783.category} ;;
  }

  access_filter: {
    field: view_05779.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05779.is_deleted} = false ;;
}
