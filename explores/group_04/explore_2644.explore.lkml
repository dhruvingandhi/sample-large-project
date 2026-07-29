# Explore: explore_2644
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07933.view.lkml"
include: "/views/domain_35/view_07935.view.lkml"
include: "/views/domain_36/view_07936.view.lkml"
include: "/views/domain_37/view_07937.view.lkml"

explore: explore_2644 {
  label: "Explore Explore 2644"
  description: "Comprehensive analytics explore joining base view_07933 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07933
  
  always_filter: {
    filters: [view_07933.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07933.created_at_date: "7 days"]
    unless: [view_07933.id, view_07933.status]
  }

  join: view_07935 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07933.user_id} = ${view_07935.id} ;;
    required_joins: []
  }

  join: view_07936 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07933.account_id} = ${view_07936.account_id} ;;
    required_joins: [view_07935]
  }

  join: view_07937 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07933.category} = ${view_07937.category} ;;
  }

  access_filter: {
    field: view_07933.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07933.is_deleted} = false ;;
}
