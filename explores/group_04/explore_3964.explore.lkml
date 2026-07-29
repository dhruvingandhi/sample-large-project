# Explore: explore_3964
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11893.view.lkml"
include: "/views/domain_45/view_11895.view.lkml"
include: "/views/domain_46/view_11896.view.lkml"
include: "/views/domain_47/view_11897.view.lkml"

explore: explore_3964 {
  label: "Explore Explore 3964"
  description: "Comprehensive analytics explore joining base view_11893 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11893
  
  always_filter: {
    filters: [view_11893.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11893.created_at_date: "7 days"]
    unless: [view_11893.id, view_11893.status]
  }

  join: view_11895 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11893.user_id} = ${view_11895.id} ;;
    required_joins: []
  }

  join: view_11896 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11893.account_id} = ${view_11896.account_id} ;;
    required_joins: [view_11895]
  }

  join: view_11897 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11893.category} = ${view_11897.category} ;;
  }

  access_filter: {
    field: view_11893.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11893.is_deleted} = false ;;
}
