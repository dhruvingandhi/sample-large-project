# Explore: explore_2926
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08779.view.lkml"
include: "/views/domain_31/view_08781.view.lkml"
include: "/views/domain_32/view_08782.view.lkml"
include: "/views/domain_33/view_08783.view.lkml"

explore: explore_2926 {
  label: "Explore Explore 2926"
  description: "Comprehensive analytics explore joining base view_08779 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08779
  
  always_filter: {
    filters: [view_08779.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08779.created_at_date: "7 days"]
    unless: [view_08779.id, view_08779.status]
  }

  join: view_08781 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08779.user_id} = ${view_08781.id} ;;
    required_joins: []
  }

  join: view_08782 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08779.account_id} = ${view_08782.account_id} ;;
    required_joins: [view_08781]
  }

  join: view_08783 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08779.category} = ${view_08783.category} ;;
  }

  access_filter: {
    field: view_08779.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08779.is_deleted} = false ;;
}
