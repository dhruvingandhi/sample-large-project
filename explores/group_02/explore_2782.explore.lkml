# Explore: explore_2782
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08347.view.lkml"
include: "/views/domain_49/view_08349.view.lkml"
include: "/views/domain_50/view_08350.view.lkml"
include: "/views/domain_01/view_08351.view.lkml"

explore: explore_2782 {
  label: "Explore Explore 2782"
  description: "Comprehensive analytics explore joining base view_08347 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08347
  
  always_filter: {
    filters: [view_08347.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08347.created_at_date: "7 days"]
    unless: [view_08347.id, view_08347.status]
  }

  join: view_08349 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08347.user_id} = ${view_08349.id} ;;
    required_joins: []
  }

  join: view_08350 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08347.account_id} = ${view_08350.account_id} ;;
    required_joins: [view_08349]
  }

  join: view_08351 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08347.category} = ${view_08351.category} ;;
  }

  access_filter: {
    field: view_08347.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08347.is_deleted} = false ;;
}
