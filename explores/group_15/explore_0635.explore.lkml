# Explore: explore_0635
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01906.view.lkml"
include: "/views/domain_08/view_01908.view.lkml"
include: "/views/domain_09/view_01909.view.lkml"
include: "/views/domain_10/view_01910.view.lkml"

explore: explore_0635 {
  label: "Explore Explore 0635"
  description: "Comprehensive analytics explore joining base view_01906 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01906
  
  always_filter: {
    filters: [view_01906.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01906.created_at_date: "7 days"]
    unless: [view_01906.id, view_01906.status]
  }

  join: view_01908 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01906.user_id} = ${view_01908.id} ;;
    required_joins: []
  }

  join: view_01909 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01906.account_id} = ${view_01909.account_id} ;;
    required_joins: [view_01908]
  }

  join: view_01910 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01906.category} = ${view_01910.category} ;;
  }

  access_filter: {
    field: view_01906.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01906.is_deleted} = false ;;
}
