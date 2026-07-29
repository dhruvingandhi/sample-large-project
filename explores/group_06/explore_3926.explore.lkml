# Explore: explore_3926
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11779.view.lkml"
include: "/views/domain_31/view_11781.view.lkml"
include: "/views/domain_32/view_11782.view.lkml"
include: "/views/domain_33/view_11783.view.lkml"

explore: explore_3926 {
  label: "Explore Explore 3926"
  description: "Comprehensive analytics explore joining base view_11779 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11779
  
  always_filter: {
    filters: [view_11779.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11779.created_at_date: "7 days"]
    unless: [view_11779.id, view_11779.status]
  }

  join: view_11781 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11779.user_id} = ${view_11781.id} ;;
    required_joins: []
  }

  join: view_11782 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11779.account_id} = ${view_11782.account_id} ;;
    required_joins: [view_11781]
  }

  join: view_11783 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11779.category} = ${view_11783.category} ;;
  }

  access_filter: {
    field: view_11779.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11779.is_deleted} = false ;;
}
