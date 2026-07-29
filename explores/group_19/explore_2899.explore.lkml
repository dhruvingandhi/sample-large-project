# Explore: explore_2899
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08698.view.lkml"
include: "/views/domain_50/view_08700.view.lkml"
include: "/views/domain_01/view_08701.view.lkml"
include: "/views/domain_02/view_08702.view.lkml"

explore: explore_2899 {
  label: "Explore Explore 2899"
  description: "Comprehensive analytics explore joining base view_08698 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08698
  
  always_filter: {
    filters: [view_08698.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08698.created_at_date: "7 days"]
    unless: [view_08698.id, view_08698.status]
  }

  join: view_08700 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08698.user_id} = ${view_08700.id} ;;
    required_joins: []
  }

  join: view_08701 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08698.account_id} = ${view_08701.account_id} ;;
    required_joins: [view_08700]
  }

  join: view_08702 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08698.category} = ${view_08702.category} ;;
  }

  access_filter: {
    field: view_08698.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08698.is_deleted} = false ;;
}
